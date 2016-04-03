# License

Copyright 2015 Stefano Terna

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# iottly-http-load-balancer
The *iottly-http-load-balancer* repo hosts the **[nginx](http://nginx.org/en/)** configuration for the load balancer in front of:
- https://github.com/iottly/iottly-core
  - API exposed as proxy pass via `localhost:8550/v1.0/[service path]`
  - Web socket exposed as proxy pass via: `localhost:8560/v1.0`
  - exposing API and WS on two different ports allows to simulate production envs in which API and WS are served by different domains (maybe subdomains)
- https://github.com/iottly/iottly-console
  - UI exsposed as a static redirect via: `localhost:8580/[resource path]`
  - specific aliasing of `bower_components` are defined for compatibility with bower install paths

Cross origin issues arising from iottly-console trying to access API and WS on different domains, are entirely managed via [nginx.conf](https://github.com/iottly/iottly-http-load-balancer/blob/master/nginx_conf/conf.d/iottly.conf) file, none of them being set up into iottly-core:
- proper CORS headers are added to the responses 
