// Automaticaly generated by rust_swig
package com.example.wallet_flutter;


public final class Outputs {

    public Outputs(String a0, long a1)  {

        mNativeObj = init(a0, a1);
    }
    private static native long init(String a0, long a1) ;

    public synchronized void delete() {
        if (mNativeObj != 0) {
            do_delete(mNativeObj);
            mNativeObj = 0;
       }
    }
    @Override
    protected void finalize() throws Throwable {
        try {
            delete();
        }
        finally {
             super.finalize();
        }
    }
    private static native void do_delete(long me);
    /*package*/ long mNativeObj;
}