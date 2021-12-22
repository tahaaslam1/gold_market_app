abstract class IItemRepositry {
  Future<dynamic> getItemList({String userId});
  Future<dynamic> addNewItem({String userEmailId,String itemType,var valuePerOunce,var qty,var weight,var itemValue,var karrot});
  Future<dynamic> deleteItem({String userId,String inventoryId,String itemId});
}
