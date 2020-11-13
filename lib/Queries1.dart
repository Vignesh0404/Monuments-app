//Monument Page Flow

//1. Monument List ->

String monumentList = r'''
query MonumentsList($limit: Int,$offset: Int){
  monuments(where:{status:{_eq:true},is_active:{_eq:true},details:{_contains:{mt_isActiveOnApp:"yes"}}},
  limit:$limit,offset:$offset,order_by: {created_at: desc}){
    id
    details
    name
    location_name
    status
    era {
    name
    }
  } 
} 
''';

String eraBasedMonuments = r'''
query MyQuery($limit: Int,$offset: Int) {
  era(where: {id: {_eq: 28}},limit:$limit,offset:$offset) {
    monuments {
      location
      name
      details
    }
  }
}
''';
