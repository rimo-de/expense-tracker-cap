using ExpenseTracker as service from '../../srv/ExpenseTracker';

annotate service.Transactions with @(
    UI.FieldGroup #transData     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Transaction Date',
                Value: transactionDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Amount',
                Value: amount,
            },
        ],
    },

    UI.FieldGroup #classification: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: category_ID,
            },
        ],
    },
    UI.FieldGroup #status        : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: status_code,
        }, ],
    },
    UI.FieldGroup #AdminInfo     : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Created By',
                Value: createdBy,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Created At',
                Value: createdAt,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Changed By',
                Value: modifiedBy,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Changed At',
                Value: modifiedAt,
            },
        ],
    },

    UI.Facets                    : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'GeneralInformation',
        Label : 'General Information',

        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'TransactionDetails',
                Label : 'Transaction Details',
                Target: '@UI.FieldGroup#transData',
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Classification',
                Label : 'Classification',
                Target: '@UI.FieldGroup#classification',
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Status',
                Label : 'Status',
                Target: '@UI.FieldGroup#status',
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'AdminInfo',
                Label : 'Administrative Information',
                Target: '@UI.FieldGroup#AdminInfo',
            },
        ],
    }, ],

    UI.SelectionFields           : [
        transactionDate,
        category_ID,
        status_code
    ],

    UI.DataPoint #StatusDataPoint: {
        $Type      : 'UI.DataPointType',
        Value      : status_code,
        Criticality: status.criticality,
    },

    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'Transaction Date',
            Value: transactionDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Amount',
            Value: amount,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
        },
        /*         {
                    $Type: 'UI.DataField',
                    Label: 'Status',
                    Value: status.code,
                }, */
        {
            $Type                : 'UI.DataFieldForAnnotation',
            Label                : 'Status',
            Target               : '@UI.DataPoint#StatusDataPoint',
            ![@HTML5.CssDefaults]: {width: '10rem'},
        },
    ],
    UI.HeaderInfo                : {
        TypeName      : 'Transaction',
        TypeNamePlural: 'Transactions',
        Title         : {
            $Type: 'UI.DataField',
            Value: description
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: transactionDate
        }
    }
);

annotate service.Transactions with {
    amount @Measures.ISOCurrency: currency_code;
};

annotate service.TransactionStatuses with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        Label          : 'Status',
    };
};

annotate service.Transactions with {
    transactionDate @Common.Label: 'Transaction Date';
    category        @Common.Label: 'Category';
};

annotate service.Transactions with {
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
                ValueListProperty: 'type',
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
    };
};

annotate service.Transactions with {
    category @Common.Text: category.name;
    category @Common.TextArrangement: #TextOnly;
};

annotate service.Transactions with {
    recurringPlan @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'RecurringPlans',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: recurringPlan_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'description',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'amount',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'currency_code',
            },
        ],
    }
};

annotate service.Transactions with {
    status_code @Common.ValueList               : {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'TransactionStatuses',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    };

    status_code @Common.ValueListWithFixedValues: true;

    status_code @Common                         : {
        Text           : status.name,
        TextArrangement: #TextFirst
    };
};
