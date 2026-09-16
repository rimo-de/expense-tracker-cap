using ExpenseTracker as service from '../../srv/ExpenseTracker';
annotate service.Budgets with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'year',
                Value : year,
            },
            {
                $Type : 'UI.DataField',
                Label : 'month',
                Value : month,
            },
            {
                $Type : 'UI.DataField',
                Label : 'allocateAmount',
                Value : allocateAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'currency_code',
                Value : currency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'notes',
                Value : notes,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Data',
            ID : 'GeneralData',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'General Data',
                    ID : 'GeneralData1',
                    Target : '@UI.FieldGroup#GeneralData',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Additional Data',
                    ID : 'AdditionalData',
                    Target : '@UI.FieldGroup#AdditionalData',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Administrative Information',
                    ID : 'AdministrativeInformation',
                    Target : '@UI.FieldGroup#AdministrativeInformation',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Year',
            Value : year,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Month',
            Value : month,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Allocated amount',
            Value : allocateAmount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Notes',
            Value : notes,
        },
    ],
    UI.SelectionFields : [
        month,
        year,
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'HeaderSection',
            Target : '@UI.FieldGroup#HeaderSection',
        },
    ],
    UI.FieldGroup #HeaderSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : month,
            },
            {
                $Type : 'UI.DataField',
                Value : year,
            },
        ],
    },
    UI.FieldGroup #GeneralData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : year,
            },
            {
                $Type : 'UI.DataField',
                Value : month,
            },
        ],
    },
    UI.FieldGroup #AdditionalData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : allocateAmount,
                Label : 'allocateAmount',
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    UI.FieldGroup #AdministrativeInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Budget',
        TypeNamePlural : 'Budgets',
    },
);

annotate service.Budgets with {
    category @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Categories',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : category_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'type_code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'icon',
            },
        ],
    }
};

annotate service.Budgets with {
    month @Common.Label : 'Month'
};

annotate service.Budgets with {
    year @Common.Label : 'Year'
};

