module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: 'module'
  },
  env: {
    browser: true,
    es6: true,
    node: true
  },
  extends: 'standard',
  rules: {
    'arrow-parens': 0,
    'generator-star-spacing': 0
  }
}
