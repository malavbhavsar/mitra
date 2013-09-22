// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.h instead.

#import <CoreData/CoreData.h>


extern const struct ServiceAttributes {
	__unsafe_unretained NSString *all_day;
	__unsafe_unretained NSString *brief_description;
	__unsafe_unretained NSString *can_travel;
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *fee;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *long_description;
	__unsafe_unretained NSString *max_ppl;
	__unsafe_unretained NSString *min_ppl;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *picture_url;
	__unsafe_unretained NSString *serviceID;
	__unsafe_unretained NSString *time_from;
	__unsafe_unretained NSString *time_to;
	__unsafe_unretained NSString *userid;
} ServiceAttributes;

extern const struct ServiceRelationships {
	__unsafe_unretained NSString *user;
} ServiceRelationships;

extern const struct ServiceFetchedProperties {
} ServiceFetchedProperties;

@class User;

















@interface ServiceID : NSManagedObjectID {}
@end

@interface _Service : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ServiceID*)objectID;





@property (nonatomic, strong) NSNumber* all_day;



@property BOOL all_dayValue;
- (BOOL)all_dayValue;
- (void)setAll_dayValue:(BOOL)value_;

//- (BOOL)validateAll_day:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* brief_description;



//- (BOOL)validateBrief_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* can_travel;



@property BOOL can_travelValue;
- (BOOL)can_travelValue;
- (void)setCan_travelValue:(BOOL)value_;

//- (BOOL)validateCan_travel:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* created_at;



//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* fee;



@property float feeValue;
- (float)feeValue;
- (void)setFeeValue:(float)value_;

//- (BOOL)validateFee:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* location;



//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* long_description;



//- (BOOL)validateLong_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* max_ppl;



@property int64_t max_pplValue;
- (int64_t)max_pplValue;
- (void)setMax_pplValue:(int64_t)value_;

//- (BOOL)validateMax_ppl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* min_ppl;



@property int64_t min_pplValue;
- (int64_t)min_pplValue;
- (void)setMin_pplValue:(int64_t)value_;

//- (BOOL)validateMin_ppl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picture_url;



//- (BOOL)validatePicture_url:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* serviceID;



@property int16_t serviceIDValue;
- (int16_t)serviceIDValue;
- (void)setServiceIDValue:(int16_t)value_;

//- (BOOL)validateServiceID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* time_from;



//- (BOOL)validateTime_from:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* time_to;



//- (BOOL)validateTime_to:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userid;



@property int64_t useridValue;
- (int64_t)useridValue;
- (void)setUseridValue:(int64_t)value_;

//- (BOOL)validateUserid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) User *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _Service (CoreDataGeneratedAccessors)

@end

@interface _Service (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAll_day;
- (void)setPrimitiveAll_day:(NSNumber*)value;

- (BOOL)primitiveAll_dayValue;
- (void)setPrimitiveAll_dayValue:(BOOL)value_;




- (NSString*)primitiveBrief_description;
- (void)setPrimitiveBrief_description:(NSString*)value;




- (NSNumber*)primitiveCan_travel;
- (void)setPrimitiveCan_travel:(NSNumber*)value;

- (BOOL)primitiveCan_travelValue;
- (void)setPrimitiveCan_travelValue:(BOOL)value_;




- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;




- (NSNumber*)primitiveFee;
- (void)setPrimitiveFee:(NSNumber*)value;

- (float)primitiveFeeValue;
- (void)setPrimitiveFeeValue:(float)value_;




- (NSString*)primitiveLocation;
- (void)setPrimitiveLocation:(NSString*)value;




- (NSString*)primitiveLong_description;
- (void)setPrimitiveLong_description:(NSString*)value;




- (NSNumber*)primitiveMax_ppl;
- (void)setPrimitiveMax_ppl:(NSNumber*)value;

- (int64_t)primitiveMax_pplValue;
- (void)setPrimitiveMax_pplValue:(int64_t)value_;




- (NSNumber*)primitiveMin_ppl;
- (void)setPrimitiveMin_ppl:(NSNumber*)value;

- (int64_t)primitiveMin_pplValue;
- (void)setPrimitiveMin_pplValue:(int64_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePicture_url;
- (void)setPrimitivePicture_url:(NSString*)value;




- (NSNumber*)primitiveServiceID;
- (void)setPrimitiveServiceID:(NSNumber*)value;

- (int16_t)primitiveServiceIDValue;
- (void)setPrimitiveServiceIDValue:(int16_t)value_;




- (NSDate*)primitiveTime_from;
- (void)setPrimitiveTime_from:(NSDate*)value;




- (NSDate*)primitiveTime_to;
- (void)setPrimitiveTime_to:(NSDate*)value;




- (NSNumber*)primitiveUserid;
- (void)setPrimitiveUserid:(NSNumber*)value;

- (int64_t)primitiveUseridValue;
- (void)setPrimitiveUseridValue:(int64_t)value_;





- (User*)primitiveUser;
- (void)setPrimitiveUser:(User*)value;


@end
