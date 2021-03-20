SWIGV8_AddStaticFunction(exports_obj, "CreateEnhMetaFileWNull", _wrap_CreateEnhMetaFileWNUll, context);

static SwigV8ReturnValue _wrap_CreateEnhMetaFileW(const SwigV8Arguments &args)
{
    SWIGV8_HANDLESCOPE();

    SWIGV8_VALUE jsresult;
    HDC arg1;
    LPCWSTR arg2;
    RECT *arg3 = (RECT *)0;
    LPCWSTR arg4;
    void *argp1;
    int res1 = 0;
    void *argp2;
    int res2 = 0;
    void *argp3 = 0;
    int res3 = 0;
    void *argp4;
    int res4 = 0;
    HDC result;

    if (args.Length() != 4)
        SWIG_exception_fail(SWIG_ERROR, "Illegal number of arguments for _wrap_CreateEnhMetaFileW.");

    result = CreateEnhMetaFileW(NULL, NULL, NULL, NULL);
    jsresult = SWIG_NewPointerObj((new HDC(static_cast<const HDC &>(result))), SWIGTYPE_p_HDC, SWIG_POINTER_OWN | 0);

    SWIGV8_RETURN(jsresult);

    goto fail;
fail:
    SWIGV8_RETURN(SWIGV8_UNDEFINED());
}
