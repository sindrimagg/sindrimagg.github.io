# Dýptarleit

Dýptarleit er eitt mikilvægasta reikniritið í netafræði. Það er undirstaðan í mörgum reikniritum og er meðal annars hægt að nota til þess að finna einhvern veg á milli tveggja hnúta og ef netið er tré finnur það stysta veginn milli þeirra því það er einungis einn vegur á milli tveggja hnúta í trjám. Einnig er það notað til að finna grannröðun í stefndu óhringuðu neti. Til þess að finna Euler veg eða Euler hring er dýptarleit breytt örlítið.

## Útfærsla

Við sýnum tvær útfærslur. Sú fyrri byggir á sjálfkvaðningu (e. recursion) hin á ítrun og notar gagnagrindina hlaða (e. stack).

~~~c++
vector<vector<int>> net;
int n;
vector<bool> fundinn;

void dfs(int v) {
    fundinn[v] = true;
    for (int u : net[v]) {
        if (!visited[u]) dfs[u];
    }
}
~~~

Hér kemur svo ítrunarútgáfan. Athugið að það væri hægt að gera hana á mismunandi vegu en þarf ekki alltaf að vera dýptarleit. Til dæmis er reikniritinu fyrir breiddarleit stundum breytt frá því að nota röð í að nota hlaða, en sú útfærsla af dýptarleit gefur ekki sömu niðurstöðu og sjálfkvaðninga útgáfan.

~~~c++
vector<vector<int>> net;
int n;
vector<bool> fundinn;

void dfs(int v) {
    stack<int> hladi;
    hladi.push(v);

    while (!hladi.empty()) {
        int u = hladi.top();
        hladi.pop();
        
        if (!fundinn[u]) {
            fundinn[u] = true;
            for (int w : net[u]) {
                if (!fundinn[w]) hladi.push(w);
            }
        }
    }
}
~~~

Báðar útfærslur hafa tímaflækju \(O(|V| + |E|)\), þar sem \(|V|\) er fjöldi hnúta og \(|E|\) er fjöldi leggja í netinu. Hins vegar notar sjálfkvaðninga útgáfan minna minni eða \(O(|V|)\) á meðan ítrunarútgáfan notar \(O(|E|) = O(|V|^2)\).
