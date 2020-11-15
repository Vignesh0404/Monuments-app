//Monument Page Flow

//1. Monument List ->

String monumentList = r'''
query MonumentsList($limit: Int, $offset: Int) {
  monuments(where: {status: {_eq: true}, is_active: {_eq: true}, details: {_contains: {mt_isActiveOnApp: "yes"}}}, limit: $limit, offset: $offset, order_by: {created_at: desc}) {
    id
    details
    name
    location_name
    status
    era {
      name
    }
    reviews_aggregate {
      aggregate {
        avg {
          rating
        }
      }
    }
  }
}
''';

String eraBasedMonuments = r'''
query MyQuery($id: Int) {
  era(where: {id: {_eq: $id}}) {
    monuments {
      location
      name
      details
      era{
        name
      }
    }
  }
}
''';

String insertReview = r'''
mutation InsertReview($monumentId: Int, $comment: String, $rating: Int) {
 insert_reviews(objects: {comment: $comment, rating: $rating, monument_id: $monumentId, user_id: "OpiSdcxGQvVizCZRauIAO7sSx3Q2"}) {
   returning {
     id,
   }
 }
}
''';

String fetchReview = r'''
query UserReview($reviewOffset: Int, $reviewLimit: Int,$mID: Int) {
  reviews(limit: $reviewLimit, offset: $reviewOffset, order_by: {updated_at: desc}, where: {status: {_neq: "rejected"}, monument: {status: {_eq: true}, details: {_contains: {mt_isActiveOnApp: "yes"}}}, monument_id: {_eq: $mID}}) {
    id
    comment
    user_id
    rating
    monument_id
    status
    is_highlighted
    updated_at
    user {
      avatar
      username
      id
    }
    monument {
      name
      location_name
      id
      is_active
    }
  }
} 
''';

String eachUserReview = r'''
query UserReview($reviewOffset: Int, $reviewLimit: Int) {
  reviews(limit: $reviewLimit, offset: $reviewOffset, order_by: {updated_at: desc}, where: {status: {_neq: "rejected"}, monument: {status: {_eq: true}, details: {_contains: {mt_isActiveOnApp: "yes"}}},  user_id: {_eq: "OpiSdcxGQvVizCZRauIAO7sSx3Q2"}}) {
    id
    comment
    user_id
    rating
    monument_id
    status
    is_highlighted
    updated_at
    user {
      avatar
      username
      id
    }
    monument {
      name
      location_name
      id
      is_active
    }
  }
}
''';

String deleteReview = r'''
mutation DeleteReview($reviewId: Int) {
 delete_reviews(where: {id: {_eq: $reviewId}}) {
   affected_rows
   returning {
         id
       }
 }
}
''';

String updateReview = r'''
mutation UpdateReview($reviewId: Int, $comment: String, $rating: Int ) {
   update_reviews(where: {id: {_eq: $reviewId}}, _set: {comment: $comment, rating: $rating}) {
       affected_rows
   }
}
''';

String insertBookmark = r'''
mutation InsertMonumentBookmark (
 $monumentId: Int,
 $type: String
) {
 insert_bookmark(objects:
   {
     monument_id: $monumentId,
     type: $type}) {
   affected_rows
   returning {
         id
       }
 }
}
''';
