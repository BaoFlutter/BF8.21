class UserInformation {
  // các thuộc tính 
  String? userName; // public 
  int? birthYear; 
  String? address;
  String? _phoneNumber; // biến private

  // các phương thức 

  // 1. Hàm khởi tạo 
  // Chỉ có hàm khởi tạo duy nhất 
  // Hàm khởi tạo mặc định là hàm không có biến truyền vào 
  // UserInformation(); // Hàm khởi tạo mặc đinh

  /*
  UserInformation({ String? userName , int? birthYear, String? address}){
   this.userName = userName;
   this.birthYear = birthYear;
   this.address = address;
  }
  */
  UserInformation({this.userName, this.birthYear, this.address});
  
  int getAge()
  {
    return DateTime.now().year - this.birthYear!;
  }
  // hàm getter
  /*
  String? getPhoneNumber(){
    return this._phoneNumber ;
  }
  */

  String? getPhoneNumber() => this._phoneNumber ;
  
  String? get phoneNumber => this._phoneNumber ;
  // => a <=> { return a ;}


  // hàm setter

  void setPhoneNumber({required String phoneNumber}){  
    this._phoneNumber = phoneNumber;
  }




}