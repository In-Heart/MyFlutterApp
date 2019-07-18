import 'package:encrypt/encrypt.dart';
import 'dart:math';
import 'dart:convert';

  ///AES加密
  String EnCrypt(String str){
    String randomStr = RandomNum(16);
    Key key = Key.fromUtf8(randomStr);
    IV iv = IV.fromLength(16);
    Encrypter enCrypter = Encrypter(AES(key));
    Encrypted encrypted = enCrypter.encrypt(str, iv: iv);
    String result = encrypted.base16;
//    String result2 = encrypted.bytes.toString();
//    String jsonResult  = json.decode(encrypted.toString());
//    String result1 = DeCrypt(result);
    return result;
  }

  ///AES解密
  String DeCrypt(String str){
    String randomStr = RandomNum(16);
    Key key = Key.fromUtf8(randomStr);
    IV iv = IV.fromLength(16);
    Encrypter deCrypter = Encrypter(AES(key));
    // ignore: argument_type_not_assignable
    String decrypted = deCrypter.decrypt16(str, iv: iv);
    // ignore: argument_type_not_assignable
    return deCrypter.decrypt16(str, iv: iv);
  }

  ///生成长度为length的随机序列
  String RandomNum(int length) {
    var arr = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    String left = '';
    for (var i = 0; i < length; i++) {
      left = left + arr[Random().nextInt(arr.length)];
    }
    return left;
  }