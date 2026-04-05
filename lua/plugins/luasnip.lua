return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")

    -- template
    ls.add_snippets("cpp", {
      ls.parser.parse_snippet("cpp", [[
#include <bits/stdc++.h>
using namespace std;

#define all(x) begin(x), end(x)
#define sz(x) (int)(x).size()
typedef long long ll;

int main() {
  ios_base::sync_with_stdio(0);
  cin.tie(0);
  
  $1
}
]])
    })
  end,
}
