# 
# Copyright 2015 Stefano Terna
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 

# Set nginx base image
FROM nginx

MAINTAINER iottly

# Add iottly configuration file from the current directory
ADD nginx_conf_prod/conf.d /etc/nginx/conf.d

# Expose ports
# api:
EXPOSE 8550

# web socket:
EXPOSE 8560

# front-end:
EXPOSE 8580

#production
EXPOSE 80
EXPOSE 443
