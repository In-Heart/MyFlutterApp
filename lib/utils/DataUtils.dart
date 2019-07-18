import 'package:shared_preferences/shared_preferences.dart';

  // 从SharedPreferences获取数据
  getAsyncData(String name) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(name);
  }

  // 保存数据到SharedPreferences
  setAsyncIntData (String name, int value) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    if(name != null){
      return sharedPreferences.setInt(name, value);
    }
    return false;
  }

  // 保存数据到SharedPreferences
  setAsyncBoolData (String name, bool value) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    if(name != null){
      return sharedPreferences.setBool(name, value);
    }
    return false;
  }

  // 保存数据到SharedPreferences
  setAsyncDoubleData (String name, double value) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    if(name != null){
      return sharedPreferences.setDouble(name, value);
    }
    return false;
  }

  // 保存数据到SharedPreferences
  setAsyncStringData (String name, String value) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    if(name != null){
      return sharedPreferences.setString(name, value);
    }
    return false;
  }

  // 保存数据到SharedPreferences
  setAsyncStringListData (String name, List<String> value) async  {
    //获取实例
    var sharedPreferences = await SharedPreferences.getInstance();
    if(name != null){
      return sharedPreferences.setStringList(name, value);
    }
    return false;
  }