// SearchPage:
String searchPageQueryEra = r'''
query SearchPage{
    era(order_by:{order:asc}){
        id
        name
        description
        color_code
    }
    
}''';
String searchPageQueryMonument = r'''
query SearchPage{
monuments(order_by:{view_count:desc},limit:4,where:{is_active:{_eq:true},
    details:{_contains:{mt_isActiveOnApp:"yes"}}}){
        id
        name
        view_count
        location_name
        details
        status
    }    
}''';
String searchPageQueryChip = r'''
query SearchPage{
tags(order_by: {monuments_x_tags_aggregate:{count:desc}},where:{monuments_x_tags:
    {monument:{details:{_contains:{mt_isActiveOnApp:"yes"}}, is_active:{_eq:true}}}}){
        id
        name
        monuments_x_tags_aggregate{
            aggregate{
                count
            }
        }
    }
}''';
String basicSearch = r'''
query search($text: String){
  monuments(where:
  {
    _or: [
      {name:{_ilike:$text}},
      {location_name:{_ilike:$text}},
      {monuments_x_tags:{tag:{name:{_ilike:$text}}}}
    ],
    is_active: {_eq: true},
    details:{_contains:{mt_isActiveOnApp:"yes"}}
  },limit:4
  ){
    id
    name
    location_name
    details
    monuments_x_tags(where:{tag:{name:{_ilike:$text}}}){
      tag{
        name
      }
    }
  }
}''';