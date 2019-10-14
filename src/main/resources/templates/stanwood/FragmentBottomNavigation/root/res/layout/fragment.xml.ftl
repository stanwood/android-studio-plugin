<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">

    <data>

        <variable
            name="navSelectedListener"
            type="com.google.android.material.bottomnavigation.BottomNavigationView.OnNavigationItemSelectedListener"/>
    </data>

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:fitsSystemWindows="true"
        android:orientation="vertical">

        <fragment
            android:id="@+id/nav_host_child_fragment"
            android:name="androidx.navigation.fragment.NavHostFragment"
            android:layout_width="match_parent"
            android:layout_height="0dp"
            android:layout_weight="1"
            android:fitsSystemWindows="true"
            app:defaultNavHost="true"
            app:navGraph="@navigation/${navGraphName}"/>

        <com.google.android.material.bottomnavigation.BottomNavigationView
            android:id="@+id/bottomNav"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            app:setOnNavigationItemSelectedListener="@{navSelectedListener}"
            app:menu="@menu/${menuName}" />
    </LinearLayout>
</layout>