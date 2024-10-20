import Text "mo:base/Text";
import Int "mo:base/Int";
import Array "mo:base/Array";  // Array modülünü ekledim

actor Hesap_Makinesi {

  var hucre : Int = 0;
  var sonIslem: Text = "Başlangıç";
  var islemGecmisi: [Text] = [];

  // Toplama.
  public func Toplama(n : Int) : async Int {
    hucre := hucre + n;
    sonIslem := Text.concat("Toplama: ", Int.toText(n));
    islemGecmisi := Array.append(islemGecmisi, [sonIslem]);  
    return hucre;
  };

  // Çıkarma.
  public func Cikarma(n : Int) : async Int {
    hucre := hucre - n;
    sonIslem := Text.concat("Çıkarma: ", Int.toText(n));
    islemGecmisi := Array.append(islemGecmisi, [sonIslem]);
    return hucre;
  };

  // Çarpma.
  public func Carpma(n : Int) : async Int {
    hucre := hucre * n;
    sonIslem := Text.concat("Çarpma: ", Int.toText(n));
    islemGecmisi := Array.append(islemGecmisi, [sonIslem]); 
    return hucre;
  };

  // Bölme.
  public func Bolme(n : Int) : async ?Int {
    if (n == 0) {
      sonIslem := "Bölme: hata (sıfıra bölme)";
      islemGecmisi := Array.append(islemGecmisi, [sonIslem]);
      return null;
    } else {
      hucre := hucre / n;
      sonIslem := Text.concat("Bölme: ", Int.toText(n));
      islemGecmisi := Array.append(islemGecmisi, [sonIslem]); 
      return ?hucre;
    };
  };

  // Negate (Sonucu tersine çevirme)
  public func negate() : async Int {
    hucre := -hucre;
    sonIslem := "Sonucu tersine çevir";
    islemGecmisi := Array.append(islemGecmisi, [sonIslem]);  // Listeye ekleme işlemi düzeltildi
    return hucre;
  };

  // Hesap makinesini temizleyin ve hücresini sıfırlayın.
  public func Temizleme() : async () {
    hucre := 0;
    sonIslem := "Temizle";
    islemGecmisi := Array.append(islemGecmisi, [sonIslem]);  // Listeye ekleme işlemi düzeltildi
    return ();
  };

  // Son işlemi döndür.
  public func SonIslem() : async Text {
    return sonIslem;
  };

  // Tüm işlem geçmişini döndür.
  public func IslemGecmisi() : async [Text] {
    return islemGecmisi;
  };
};
