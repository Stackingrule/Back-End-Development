const catchError = async (ctx, next) => {
    try {
        await next()
    } catch (error) {
        if (error.errorCode) {
            ctx.body = {
                msg: error.message,
                error_code: error.errorCode,
                request: error.requestUrl
            }
            ctx.status = error.status
        }
        ctx.body = '服务器有的问题，稍等片刻！'
    }
}

module.exports = catchError;
