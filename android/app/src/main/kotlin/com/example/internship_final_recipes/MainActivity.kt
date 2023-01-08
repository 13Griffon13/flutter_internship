package com.example.internship_final_recipes

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "todos.flutter.dev/versionInfo"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->
            when (call.method) {
                "getVersionCode" -> {
                    result.success(getVersionCode())
                }
                "getVersionName" -> {
                    result.success(getVersionName())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    fun getVersionCode(): String {
        val versionCode = BuildConfig.VERSION_CODE
        return versionCode.toString()
    }

    fun getVersionName(): String {
        val versionName = BuildConfig.VERSION_NAME
        return versionName
    }
}
