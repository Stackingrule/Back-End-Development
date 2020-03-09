const catchError = async (ctx, next) => {
    try {
        await next()
    } catch (error) {
        ctx.body = '服务器有的问题，稍等片刻！'
    }
}

module.exports = catchError;
