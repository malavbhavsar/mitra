// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Review.h instead.

#import <CoreData/CoreData.h>


extern const struct ReviewAttributes {
	__unsafe_unretained NSString *comment;
	__unsafe_unretained NSString *customerreview;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *reviewdate;
	__unsafe_unretained NSString *reviewerid;
	__unsafe_unretained NSString *userid;
} ReviewAttributes;

extern const struct ReviewRelationships {
	__unsafe_unretained NSString *user;
} ReviewRelationships;

extern const struct ReviewFetchedProperties {
} ReviewFetchedProperties;

@class User;








@interface ReviewID : NSManagedObjectID {}
@end

@interface _Review : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReviewID*)objectID;





@property (nonatomic, strong) NSString* comment;



//- (BOOL)validateComment:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* customerreview;



@property int64_t customerreviewValue;
- (int64_t)customerreviewValue;
- (void)setCustomerreviewValue:(int64_t)value_;

//- (BOOL)validateCustomerreview:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* rating;



@property int64_t ratingValue;
- (int64_t)ratingValue;
- (void)setRatingValue:(int64_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* reviewdate;



//- (BOOL)validateReviewdate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* reviewerid;



@property int64_t revieweridValue;
- (int64_t)revieweridValue;
- (void)setRevieweridValue:(int64_t)value_;

//- (BOOL)validateReviewerid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userid;



@property int64_t useridValue;
- (int64_t)useridValue;
- (void)setUseridValue:(int64_t)value_;

//- (BOOL)validateUserid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _Review (CoreDataGeneratedAccessors)

@end

@interface _Review (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveComment;
- (void)setPrimitiveComment:(NSString*)value;




- (NSNumber*)primitiveCustomerreview;
- (void)setPrimitiveCustomerreview:(NSNumber*)value;

- (int64_t)primitiveCustomerreviewValue;
- (void)setPrimitiveCustomerreviewValue:(int64_t)value_;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int64_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int64_t)value_;




- (NSDate*)primitiveReviewdate;
- (void)setPrimitiveReviewdate:(NSDate*)value;




- (NSNumber*)primitiveReviewerid;
- (void)setPrimitiveReviewerid:(NSNumber*)value;

- (int64_t)primitiveRevieweridValue;
- (void)setPrimitiveRevieweridValue:(int64_t)value_;




- (NSNumber*)primitiveUserid;
- (void)setPrimitiveUserid:(NSNumber*)value;

- (int64_t)primitiveUseridValue;
- (void)setPrimitiveUseridValue:(int64_t)value_;





- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;


@end
