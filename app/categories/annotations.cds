using ExpenseTracker as service from '../../srv/ExpenseTracker';

annotate service.Categories with @(
    UI.FieldGroup #GenData  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Category Name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category Type',
                Value: type_code,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            }
        ],
    },
    UI.FieldGroup #AddData  : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Mandatory',
                Value: mandatory,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Active',
                Value: active,
            },
        ],
    },
    UI.FieldGroup #AdminInfo: {
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
    UI.Facets               : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'GeneralInformation',
        Label : 'General Information',


        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'GeneralData',
                Label : 'General Data',
                Target: '@UI.FieldGroup#GenData',
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'AddData',
                Label : 'Additional Data',
                Target: '@UI.FieldGroup#AddData',
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'AdminInfo',
                Label : 'Administrative Information',
                Target: '@UI.FieldGroup#AdminInfo',
            },
        ],
    }, ],

    UI.SelectionFields      : [
        type_code,
        active
    ],

    UI.LineItem             : [
        {
            $Type: 'UI.DataField',
            Label: 'Category Name',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Category Type',
            Value: type.name,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: description,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Icon',
            Value: icon,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Color',
            Value: color,
        },
    ],
    UI.HeaderInfo           : {
        TypeName      : 'Category',
        TypeNamePlural: 'Categories',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    }
);

annotate service.Categories with {
    type @Common.Text           : type.name;
    type @Common.TextArrangement: #TextOnly;
};

annotate service.CategoryTypes with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        Label          : 'Category Type',
    };
};

annotate service.Categories with {

    type_code @Common.Label: 'Category Type';
    active    @Common.Label: 'Active';
    
    type_code @Common.ValueList               : {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'CategoryTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: type_code,
                ValueListProperty: 'code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
        ],
    };

    type_code @Common.ValueListWithFixedValues: true;

    type_code @Common                         : {
        Text           : type.name,
        TextArrangement: #TextFirst
    };
};
annotate service.Categories with {
    icon @UI.IsImageURL : true
};

