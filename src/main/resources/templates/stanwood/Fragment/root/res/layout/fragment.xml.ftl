<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
		xmlns:app="http://schemas.android.com/apk/res-auto">
    <androidx.coordinatorlayout.widget.CoordinatorLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
	android:fitsSystemWindows="true"
	app:statusBarBackground="@color/colorPrimaryDark"
        tools:context="${packageName}.${className}">
<#if useToolbar>
        <com.google.android.material.appbar.AppBarLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content">

            <androidx.appcompat.widget.Toolbar
                android:layout_width="match_parent"
                android:layout_height="?attr/actionBarSize"/>
        </com.google.android.material.appbar.AppBarLayout>
</#if>        
    </androidx.coordinatorlayout.widget.CoordinatorLayout>
</layout>