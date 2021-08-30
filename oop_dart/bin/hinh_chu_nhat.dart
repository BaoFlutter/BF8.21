class HinhChuNhat{

double? chieuDai;
double? chieuRong; 

HinhChuNhat({required this.chieuDai, required this.chieuRong});

double tinhChuVi(){
 return (this.chieuDai! + this.chieuRong!) * 2; 
}

double tinhDienTich(){
  return this.chieuDai! * this.chieuRong! ;
}

void getInfor (){
  print(
    "Chiều dài:" + this.chieuDai.toString() + "\n" + 
    "Chiều rộng:" + this.chieuRong.toString() + "\n" + 
    "Chu vi" + this.tinhChuVi().toString() + "\n" + 
    "Diện tích" + this.tinhDienTich().toString() + "\n"
  
  );
}


}