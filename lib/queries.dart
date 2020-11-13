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
        era{
          name
        }
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

String bookmarkQuerynew = r'''
query BookmarkList($bookmarkOffset: Int, $bookmarkLimit: Int) {
  bookmark(limit: $bookmarkLimit, offset: $bookmarkOffset, where: {user_id: {_eq: "OpiSdcxGQvVizCZRauIAO7sSx3Q2"}}, order_by: {id: desc}) {
    id
    type
    monument_id
    micro_monument_id
    micro_monument {
      hero_image
      name
      id
      is_active
    }
    }
  }
''';

String bookmarkQuery = r'''
query BookmarkList($bookmarkOffset:Int,$bookmarkLimit:Int){
  bookmark(limit:$bookmarkLimit,offset:$bookmarkOffset, where:{ monument:{
    status:{ _eq:true}, details:{_contains:{mt_isActiveOnApp:"yes"}}}}, order_by:{id:desc}){
      id
      type
      monument_id
      micro_monument_id
    }
    micro_monuments{
      hero_image
      name
      id
      is_active
    }
    monuments{
      id
      is_active
      name
      location_name
      details
      era{
        id 
        name
      }
    }
}''';
String deleteMultipleBookmark = r'''
mutation DeleteMultipleBookmark(
  $bookmarkId :[Int!]
){
  delete_bookmark(where: {id:{_in: $bookmarkId }}){
    returning {
      id
    }
  }
}''';
String insertMonument = r'''
mutation InsertMonumentBookmark(
  $monumentId : Int,
  $type : String
){
  insert_bookmark(objects:{
    monument_id: $monumentId, 
    type:$type}){
      affected_rows
      returning {
        id
      }
    }
  }
''';

