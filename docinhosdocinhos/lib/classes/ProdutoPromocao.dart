

class ProdutoPromocao {

  String _titulo;
  String _valorde;
  String _valorpara;
  String _categoria;
  String _foto;
  String _produtoID;
  String _percentpromocao;
  
  ProdutoPromocao(this._titulo,this._valorde,this._valorpara,this._categoria,this._foto,this._produtoID,this._percentpromocao);

	String get titulo => this._titulo;
  String get valorde => this._valorde;
  String get valorpara => this._valorpara;
  String get categoria => this._categoria;
  String get foto => this._foto;
  String get produtoID => this._produtoID;
  String get percentpromocao => this._percentpromocao;
  
  set titulo(String value){_titulo = value;}
  set valorde(String value){_valorde = value;}
  set valorpara(String value){_valorpara = value;}
  set categoria(String value){_categoria = value;}
  set foto(String value){_foto = value;}
  set produtoID(String value){_produtoID = value;}
  set percentpromocao(String value){_percentpromocao = value;}

}