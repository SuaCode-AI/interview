import java.lang.reflect.Method; 
import java.lang.reflect.Field; 
import java.lang.reflect.Constructor; 
import processing.core.PApplet;

void setup(){
  Code obj = new Code(); 
  
  Class cls = obj.getClass(); 
  println("The name of class is " + cls.getName()); 
   
  printFieldVal(obj, cls, "ballX");
  printFieldVal(obj, cls, "ballY");
  printFieldVal(obj, cls, "ballXSpeed");
  
  setFieldVal(obj, cls, "ballX", 50);
  setFieldVal(obj, cls, "ballY", 100);
  setFieldVal(obj, cls, "ballXSpeed", 150);
  
  printFieldVal(obj, cls, "ballX");
  printFieldVal(obj, cls, "ballY");
  printFieldVal(obj, cls, "ballXSpeed");
  
  printMethodVal(obj, cls, "b1xspeed");
  callMethod(obj, cls, "setb1yspeed", 200.5);
  printMethodVal(obj, cls, "b1yspeed");;
  
}

void draw(){

}

void printMethodVal(Code obj, Class cls, String method){
  try{
    Method methodcall1 = cls.getDeclaredMethod(method); 
    methodcall1.setAccessible(true); 
    print(method);
    print(": ");
    print(methodcall1.invoke(obj));
    println();
  }catch(Exception e){
    println(e);
  }
  
}

void callMethod(Code obj, Class cls, String method, float val){
  try{
    Method methodcall1 = cls.getDeclaredMethod(method, float.class); 
    methodcall1.setAccessible(true); 
    methodcall1.invoke(obj, val);
  }catch(Exception e){
    println(e);
  }
  
}

void printFieldVal(Code obj, Class cls, String field){
  try{
    Field field1 = cls.getDeclaredField(field); 
    field1.setAccessible(true); 
    print(field);
    print(": ");
    print(field1.get(obj));
    println();
  }catch(Exception e){
    println(e);
  }
  
}

void setFieldVal(Code obj, Class cls, String field, int val){
  try{
    Field field1 = cls.getDeclaredField(field); 
    field1.setAccessible(true); 
    field1.set(obj, val);
  }catch(Exception e){
    println(e);
  }
  
}
