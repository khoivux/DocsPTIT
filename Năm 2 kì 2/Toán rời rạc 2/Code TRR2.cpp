//---------DFS----------
int a[100][100], n, u, vs[100];
void DFS(int u)
{
	stack<int> st;
	st.push(u);
	vs[u] = 1;
	cout << u << " ";
	while(!st.empty())
	{
		int s = st.top();
		st.pop();
		for(int i = 1; i <= n; i++)
		{
			if(a[s][i] == 1 && vs[i] == 0)
			{
				cout << i << " ";
				vs[i] = 1;
				st.push(s);
				st.push(i);
				break;
			}
		}
	}
}
//---------BFS----------
int a[100][100], n, u, vs[100];
void BFS(int u)
{
	queue<int> q;
	q.push(u);
	vs[u] = 1;
	cout << u << " ";
	while(!q.empty())
	{
		int s = q.front();
		q.pop();
		for(int i = 1; i <= n; i++)
		{
			if(vs[i] == 0 && a[s][i] == 1)
			{
				q.push(i);
				vs[i] = 1;
				cout << i << " ";
			}
		}
	}
}
//--------DIJKSTRA---------
int a[100][100], n, u, vs[100], pre[100], d[100];
void Dijkstra(int u)
{
	d[u] = 0;
	for(int i = 1; i <= n; i++)
	{
		d[i] = a[u][i];
		pre[i] = u;
	}

	while(1)
	{
		int s = 0, min = 1e9;
		for(int i = 1; i <= n; i++)
		{
			if(vs[i] == 0 && d[i] < min)
			{
				s = i;
				min = d[s];
			}
		}
		if(s == 0) return;
		vs[s] = 1;
		for(int i = 1; i <= n; i++)
		{
			if(vs[i] = 0 && d[i] > d[s] + a[s][i])
			{
				d[i] = d[s] + a[s][i];
				pre[i] = s;
			}
		}
	}
}
//--------BELLMAN FORD---------
int n, s, a[100][100], d[100], e[100];
int BellmanFord(int s)
{
	for(int i = 1; i <= n; i++)
	{
		d[i] = a[s][i];
		e[i] = s;
	}
	d[s] = 0; e[s] = 0; 
	int ok = 0;
	for(int k = 1; k <= n - 1; k++)
	{
		int ok = 1;
		for(int v = 1; v <= n; v++)
		{
			for(int u = 1; u <= n; u++)
			{
				if(d[v] > d[u] + a[u][v])
				{
					d[v] = d[u] + a[u][v];
					e[v] = u;
					ok = 0;
				}
			}
		}
		if(ok == 1) return 1;
	}
	return 0;
}