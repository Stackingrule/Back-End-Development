const Koa = require('koa')

const InitManager = require('./core/init')

const app = new Koa();
console.log(process.cwd())
InitManager.initCore(app)

// app.use(book.routes());
// app.use(classic.routes());



app.listen(3000);
