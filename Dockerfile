FROM nginx:stable

COPY index.html /usr/share/nginx/html
COPY meoden.jpeg /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

