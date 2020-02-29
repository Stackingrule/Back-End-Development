const Koa = require('koa')
const Router = require('koa-router')
const app = new Koa()   // 应用程序对象
const router = new Router()

router.get('classic/latest', (ctx, next) => {
    ctx.body = {key: 'classic'}
})

app.use(router.routes())

app.listen(3000)
