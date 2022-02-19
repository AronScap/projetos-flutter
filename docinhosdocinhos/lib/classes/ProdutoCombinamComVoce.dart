

class ProdutoCombinamComVoce {

  String _titulo;
  String _valor;
  String _categoria;
  String _foto;
  String _produtoID;
  
  ProdutoCombinamComVoce(this._titulo,this._valor,this._categoria,this._foto,this._produtoID);

	String get titulo => this._titulo;
  String get valor => this._valor;
  String get categoria => this._categoria;
  String get foto => this._foto;
  String get produtoID => this._produtoID;
  
  set titulo(String value){_titulo = value;}
  set valor(String value){_valor = value;}
  set categoria(String value){_categoria = value;}
  set foto(String value){_foto = value;}
  set produtoID(String value){_produtoID = value;}

}