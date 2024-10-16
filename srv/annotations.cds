using {CatalogService as services} from './catalog-service';

annotate services.Headers with {
    ID           @title: 'Order Number';
    email        @title: 'Email';
    FirstName    @title: 'First Name';
    LastName     @title: 'Last Name';
    Country      @title: 'Country';
    CreateOn     @title: 'Created On';
    DeliveryDate @title: 'Delivery Date';
    OrderStatus  @title: 'Order Status';
    ImageUrl     @title: 'Image Url';
};


annotate services.Headers with @(
    UI.HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order Sale',
        TypeNamePlural: 'Order Sales',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID,
            Label: 'Order Number ',
        },


        Description   : {
            $Type: 'UI.DataField',
            Value: email,
        }
    },
    UI.HeaderFacets: [

        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Header1',
        },
         {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Header2',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Header3',
        },


    ],
    UI.FieldGroup #Header1: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ImageUrl,
                Label : '',
            },
        ],
    },

    UI.FieldGroup #Header2: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : FirstName,
                
            },
            {
                $Type : 'UI.DataField',
                Value : LastName,
                
            },
            {
                $Type : 'UI.DataField',
                Value : Country,
                
            },
        ],
    },
    UI.FieldGroup #Header3: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : DeliveryDate,
                
            },
            {
                $Type : 'UI.DataField',
                Value : CreateOn,
                
            },
            {
                $Type : 'UI.DataField',
                Value : OrderStatus,
                
            },
        ],
    },

    UI.LineItem  : [
        {
            $Type: 'UI.DataField',
            Value: ImageUrl,
        },

        {
            $Type: 'UI.DataField',
            Value: ID,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
        {
            $Type: 'UI.DataField',
            Value: FirstName,
        },
        {
            $Type: 'UI.DataField',
            Value: LastName,
        },
        {
            $Type: 'UI.DataField',
            Value: Country,
        },
        {
            $Type: 'UI.DataField',
            Value: CreateOn,
        },
        {
            $Type: 'UI.DataField',
            Value: DeliveryDate,
        },
        {
            $Type: 'UI.DataField',
            Value: OrderStatus
        },


    ]

);


annotate services.Headers with @(

UI.SelectionFields: [
    ID,
    email,
    Country,
    OrderStatus,

],


);

annotate services.Items with {

    ID               @title: 'Order Number';
    Position         @title: 'Position';
    Name             @title: 'Reference Name';
    Description      @title: 'Reference Description';
    ReleaseDate      @title: 'Release Date';
    DiscontinuedDate @title: 'Discontinued Date';
    Price            @title: 'Price';
    Height           @title: 'Height';
    Width            @title: 'Width';
    Depth            @title: 'Depth';
    Quantity         @title: 'Quantity';
    UnitOfMeasure    @title: 'UnitOfMeasure';
    currency         @title: 'Currency';
};

annotate services.Items with @(

UI.LineItem: [

    {
        $Type: 'UI.DataField',
        Value: Position,
    },
    {
        $Type: 'UI.DataField',
        Value: Name,
    },

    {
        $Type: 'UI.DataField',
        Value: Description,
    },

    {
        $Type: 'UI.DataField',
        Value: ReleaseDate,
    },

    {
        $Type: 'UI.DataField',
        Value: DiscontinuedDate,
    },

    {
        $Type: 'UI.DataField',
        Value: Price,
    },

    {
        $Type: 'UI.DataField',
        Value: Quantity,
    },


]


);
