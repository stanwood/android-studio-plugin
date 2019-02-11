<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:tools="http://schemas.android.com/tools"
	    xmlns:app="http://schemas.android.com/apk/res-auto">
    <androidx.coordinatorlayout.widget.CoordinatorLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
	    android:fitsSystemWindows="true"
	    app:statusBarBackground="@color/colorPrimaryDark">
<#if toolbarType=='appbar'>
        <com.google.android.material.appbar.AppBarLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content">

            <androidx.appcompat.widget.Toolbar
                android:layout_width="match_parent"
                android:layout_height="?attr/actionBarSize"/>
<#if useTabLayout>
            <com.google.android.material.tabs.TabLayout
                android:id="@+id/tabLayout"
                android:layout_width="match_parent"
                android:layout_height="wrap_content" />
</#if>
        </com.google.android.material.appbar.AppBarLayout>
</#if>
<#if toolbarType == 'none' && useTabLayout>
        <androidx.viewpager.widget.ViewPager
            android:id="@+id/pager"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            app:layout_behavior="@string/appbar_scrolling_view_behavior">
            <com.google.android.material.tabs.TabLayout
                android:id="@+id/tabLayout"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:layout_gravity="top" />
            </androidx.viewpager.widget.ViewPager>
<#else>
        <androidx.viewpager.widget.ViewPager
            android:id="@+id/pager"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            app:layout_behavior="@string/appbar_scrolling_view_behavior"/>
</#if>
    </androidx.coordinatorlayout.widget.CoordinatorLayout>
</layout>