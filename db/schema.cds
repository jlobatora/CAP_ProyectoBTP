namespace com.logali;

define type decimal : Decimal(12, 2);

type Status         : Integer enum {

    Pending   = 1;
    Completed = 2;

}

//Entidad de encabezado.
entity Headers {

    key ID           : String(36) not null;
    key email        : String(30) not null;
        FirstName    : String(30) not null;
        LastName     : String;
        Country      : String(30);
        CreateOn     : Date default $now;
        DeliveryDate : DateTime;
        OrderStatus  : Status;
        ImageUrl     : String;
        //asociacion no administrada
        //ToItems          : Association to many Items
        //                        on ToItems.ID = ID;

        ToItems : Association to many Items;

}


entity Items {

    key ID                : String(36);
    key Position          : Integer;
        Name              : String(40) not null;
        Description       : String(40);
        ReleaseDate       : Date;
        DiscontinuedDate  : Date;
        Price             : decimal;
        Height            : decimal;
        Width             : decimal;
        Depth             : decimal;
        Quantity          : decimal;
        UnitOfMeasure     : String;
        virtual NetAmount : decimal; //elemento virtual para devolver el importe de la linea. @Core.Computed : false si quisieramos enviar el neto desde el cliente.
        //asociacion no administrada
        //ToHeader          : Association to one Headers
        //                        on ToHeader.ID = ID;

        Header : Association to one Headers;
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
