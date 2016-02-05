## Issue

This is triggering changes to `app.css`
when any of the `.static` files are changed.
Somehow this breaks browsersync as it just injects the new css file,
but does not trigger a page reload.

## Reproduction steps

```
$ git clone git@github.com:rxbugs/static-html-brunch-browsersync.git
$ cd static-html-brunch-browsersync
$ npm install
$ npm start
```

Now try to make changes to `app/styles/main.scss` and `app/index.static.hbs`
or `app/layouts/main.static.hbs` and notice how manual reload is needed to
see html changes.

Note that if you remove the brunch config line

```
stylesheets: joinTo: 'app.css'
```

then this disables styles generation and restores automatic reload of html
changes.

Note that the commit (61aa0c4) only has `app/assets/index.html` and not
`static-html-brunch`. That case shows the normal expected behavior.

## Workaround

Using

```
stylesheets: joinTo: 'app.css' : /^app\/styles/
```

to only watch the `styles` path seems to fix the problem.

## Environment

```
$ npm version
{ 'simple-brunch': '0.1.0',
  npm: '3.3.12',
  ares: '1.10.1-DEV',
  http_parser: '2.6.0',
  icu: '56.1',
  modules: '47',
  node: '5.5.0',
  openssl: '1.0.2e',
  uv: '1.8.0',
  v8: '4.6.85.31',
  zlib: '1.2.8' }
```
