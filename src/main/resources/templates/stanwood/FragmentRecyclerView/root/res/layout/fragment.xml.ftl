<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">
<#if toolbarType=='none'>
        <androidx.recyclerview.widget.RecyclerView
            android:id="@+id/rcv"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"
            android:layout_width="match_parent"
            android:layout_height="match_parent"/>
<#else>
    <androidx.coordinatorlayout.widget.CoordinatorLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:fitsSystemWindows="true"
        app:statusBarBackground="@color/colorPrimaryDark">
        <#include "root://stanwood/common/root/res/layout/layout_toolbar.xml.ftl" />
        <androidx.recyclerview.widget.RecyclerView
            android:id="@+id/rcv"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"
            android:layout_width="match_parent"
            android:layout_height="match_parent"/>
    </androidx.coordinatorlayout.widget.CoordinatorLayout>

</#if>
</layout>