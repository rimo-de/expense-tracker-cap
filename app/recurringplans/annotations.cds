using ExpenseTracker as service from '../../srv/ExpenseTracker';

annotate service.RecurringPlans with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Amount',
                Value: amount,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Recurring Plan',
            ID : 'Collection',
            Facets : [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'GeneratedFacet1',
                Label : 'Plan Details',
                Target: '@UI.FieldGroup#GeneratedGroup',
            },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Schedule',
                    ID : 'Tets',
                    Target : '@UI.FieldGroup#Tets',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status',
                    ID : 'Status',
                    Target : '@UI.FieldGroup#Status',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Administrative Information',
                    ID : 'AdministrativeInformation',
                    Target : '@UI.FieldGroup#AdministrativeInformation1',
                },
            ],
        }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Amount',
            Value: amount,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Frequency',
            Value: frequency_code,
        },
    ],
    UI.FieldGroup #AdministrativeInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #Tets : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : frequency.name,
                Label : 'Frequency',
            },
            {
                $Type : 'UI.DataField',
                Value : startDate,
                Label : 'Start Date',
            },
            {
                $Type : 'UI.DataField',
                Value : endDate,
                Label : 'End Date',
            },
            {
                $Type : 'UI.DataField',
                Value : nextDueDate,
                Label : 'Next Due Date',
            },
        ],
    },
    UI.FieldGroup #Status : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : active,
                Label : 'Active',
            },
        ],
    },
    UI.FieldGroup #AdministrativeInformation1 : {
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
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Header',
            Target : '@UI.FieldGroup#Header',
        },
    ],
    UI.FieldGroup #Header : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Recurring Plan',
        TypeNamePlural : 'Recurring Plans',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
    },
);

annotate service.RecurringPlans with {
    category @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Categories',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: category_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'type_code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'description',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'icon',
            },
        ],
    }
};

annotate service.RecurringPlans with {
    amount @Measures.ISOCurrency: currency_code
};

// Frequency dropdown and description
annotate service.RecurringPlans with {
    frequency_code @(
        Common.Text                    : frequency.name,
        Common.Text.@UI.TextArrangement: #TextFirst,

        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            Label         : 'Frequency',
            CollectionPath: 'Frequencies',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: frequency_code,
                    ValueListProperty: 'code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name'
                }
            ]
        },

        Common.ValueListWithFixedValues: true
    );
};

// Display frequency descriptions in value help
annotate service.Frequencies with {
    code @(
        Common.Text                    : name,
        Common.Text.@UI.TextArrangement: #TextFirst
    );
};
