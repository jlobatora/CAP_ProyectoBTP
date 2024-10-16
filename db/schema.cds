namespace com.logali;

using { Country, managed } from '@sap/cds/common';

define type decimal : Decimal(12, 2);

type Status         : Integer enum {

    Pending   = 1;
    Completed = 2;
    Rejected  = 3;

}

//Entidad de encabezado.
entity Headers  {

    key ID           : String(36) not null;
    key email        : String(30) not null;
        FirstName    : String(30) not null;
        LastName     : String;
        Country      : String(30);
        CreateOn     : Date default $now;
        DeliveryDate : DateTime;
        OrderStatus  : Status default 1;
        ImageUrl     : String @UI.IsImageURL;
        //asociacion no administrada
        //ToItems          : Association to many Items
        //                        on ToItems.ID = ID;
        //Items : Association to many Items on Items.ID = $self.ID;
        Items        : Composition of many Items
                           on Items.Header = $self;

}

entity Items {

    key ID                : String(36) not null;
    key Position          : Integer;
        Name              : localized String(40) not null;
        Description       : localized String(40);
        ReleaseDate       : Date;
        DiscontinuedDate  : Date;

        Price             : decimal @Measures.ISOCurrency: currency;
        Height            : decimal @Measures.Unit : UnitOfMeasure;
        Width             : decimal @Measures.Unit : UnitOfMeasure;
        Depth             : decimal  @Measures.Unit : UnitOfMeasure;
        Quantity          : decimal;
        UnitOfMeasure     : localized String @Common.IsUnit;
        virtual NetAmount : decimal; //elemento virtual para devolver el importe de la linea. @Core.Computed : false si quisieramos enviar el neto desde el cliente.
        //asociacion no administrada
        //ToHeader          : Association to one Headers
        //                        on ToHeader.ID = ID;
        currency : String default 'EUR' @Common.IsCurrency;
        //Header : Association to one Headers on Header.ID = $self.ID;
        Header            : Association to Headers;
}

entity SelOrderTotal as
    select from Headers
    left join Items
        on Headers.ID = Items.ID
    {
        Headers.ID,
        email,
        sum(
            Price * Quantity
        ) as TotalAmount

    }
    group by
        Headers.ID,
        email;
