# A Gin Server Serving Bundled Rego Policies

### STEPS:
<ul>
<li> opa run -s -c config.yaml -a localhost:8181 (need to have opa installed) </li>
<li> go run ./cmd </li>
<li> a json sent to OPA has to have an input field, create such a copy of your json if necessary </li>
<li> send the input file and request evaluation from OPA : <br/>
curl localhost:8181/v1/data/rules/allow -d @data/input-data.json -H 'Content-Type: application/json' </li>
</ul>

documentation : <br/>
https://www.openpolicyagent.org/docs/latest/#running-opa
<br/>
https://www.openpolicyagent.org/docs/latest/integration


