const Koa = require('koa')

const app = new Koa()   // 应用程序对象



app.use( (ctx, next) => {
    console.log(1)
    next()
    console.log(2)
})

app.use((cyx, next) => {
    console.log(3)
    //next()
    console.log(4)
})
app.listen(3000)
