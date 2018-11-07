
/*---------------------------------------------------------------
Este programa serve para checar quais e quantos componentes possui o grafo, primeiro se digita a quantidade de testes da qual deseja executar, em seguida é digitado quantos vértices possuem o grafo, quantas arestas possuem o grafo, e por fim cada uma das conexões, exemplo:
1
3, 1
a, b

retorna:

Case #1:
a,b,c,
1 connected components
---------------------------------------------------------------*/

#include <iostream>
#include <vector>
#include <sstream>
#include <string>
#include <algorithm>
using namespace std;

class Vertice{
  private:
    vector<bool> adj;
    char id;
    bool cor;

  public:

    Vertice(){
      this->id = 0;
      this->cor = false;
    }

    void setAresta(char id){
      int idi = (int)id-97; 
      this->adj.at(idi)=true;
      this->cor = false;
    }

    void setCor(bool colorido){
      this->cor = colorido;
    }

    bool getCor (){
      return this->cor;
    }

    string getAdj(){
      string adj = "";
      stringstream ss;
      for (int i = 0; i<this->adj.size();i++){
        if (this->adj.at(i) == true){
          ss<<i;
        }
      }
      adj = ss.str();
      return adj;
    }

    Vertice(int id){
      char conversor = id+'0'+49;
      stringstream ss;
      ss << conversor;
      this->id = ss.str().at(0);
    }

    void setTamanho(int tam){
      this->adj.resize(tam);
    }

    char getId(){
      return this->id;
    }


};

void setAresta(char v1,char v2, vector<Vertice>* vertices){
  int v1i,v2i;
  v1i = (int)v1 -97;
  v2i = (int)v2 -97;
  vertices->at(v1i).setAresta(v2);
  vertices->at(v2i).setAresta(v1);
}

string setComponente(Vertice *vertice, vector<Vertice> *vertices){
  string adj = vertice->getAdj();
  //cout << "linha 1\n";
  string resp = "";
  //cout << "linha 2\n";
  resp += vertice->getId();
  //cout << "linha 3\n";
  if (!vertice->getCor()){
    //cout << "linha 4\n";
    vertice->setCor(true);
    //cout << "linha 5\n";
    for(int i = 0; i < adj.size(); i++){
      //cout << "linha 6\n";
      int idi = adj.at(i)-48;
      //cout << "linha 7\n";
      //cout << idi;
      //cout << "linha 8\n";
      if(vertices->at(idi).getCor()==false){
        //cout << "linha 9\n";
        resp += setComponente(&(vertices->at(idi)),vertices);
        //cout << "linha 10\n";
      }
    }
  }
  sort (adj.begin(),adj.end());
  return resp;
}

vector<string> getComponente (vector<Vertice> *vertices){
  vector<string> componentes;
  /*if (vertices->size()>0){
    componentes.push_back("");
    componentes.at(0).append(setComponente());
  }*/

  for (int i = 0; i<vertices->size(); i++){
    if(vertices->at(i).getCor()==false){
     
      componentes.push_back("");
      componentes.back().append(setComponente(&(vertices->at(i)),vertices));
    }
  }
  return componentes;
}


int main() {
  int n,v,e;
  cin >> n;
  
  for (int i = 0; i<n; i++){
    cout << "Case #" << i+1 << ":\n";
    vector<Vertice> vertices;
    cin >> v;
    cin >> e;
    for (int j = 0; j<v; j++){
      vertices.push_back(*new Vertice(j));
      vertices.at(j).setTamanho(v);
    }
    for (int j = 0; j<e; j++){
      char v1, v2;
      cin >> v1;
      cin >> v2;
      setAresta(v1, v2, &vertices);
    }
    vector<string> componentes;
    componentes=(getComponente(&vertices));
    vector<string> respostas;
    for (int j = 0; j<componentes.size(); j++){
      respostas.push_back("");
      for (int k = 0; k<componentes.at(j).size(); k++){
        respostas.at(j) += componentes.at(j).at(k);
        respostas.at(j) += ",";
      }
      cout << respostas.at(j) << "\n";
    }
    cout << respostas.size() << " connected components\n\n";
    //cout << vertices.at(0).getAdj().size();


  }
}