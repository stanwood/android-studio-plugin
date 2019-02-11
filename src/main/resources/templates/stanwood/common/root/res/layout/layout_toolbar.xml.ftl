<#if toolbarType!='none'>
<com.google.android.material.appbar.AppBarLayout
    android:layout_width="match_parent"
    android:layout_height="wrap_content">
<#if toolbarType=='parallax'>
    <io.stanwood.framework.ui.widget.ParallaxToolbarLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:fitsSystemWindows="true"
        app:layout_scrollFlags="scroll|exitUntilCollapsed"
        app:scrim="@color/colorPrimary"
        app:statusScrim="@color/colorPrimaryDark"
        app:titleTextView="@id/title">
            <ImageView
                android:layout_width="match_parent"
                android:layout_height="200dp"
                android:fitsSystemWindows="true"
                android:src="@mipmap/ic_launcher"
                app:parallaxMode="parallax"/>
            <androidx.appcompat.widget.Toolbar
                android:layout_width="match_parent"
                android:layout_height="?attr/actionBarSize"
                android:gravity="center"
                app:parallaxMode="pin">
                    <TextView
                    android:id="@+id/title"
                    android:layout_width="wrap_content"
                    android:layout_height="match_parent"
                    android:gravity="start"
                    android:textAppearance="@style/TextAppearance.MaterialComponents.Headline6"
                    android:textColor="?android:attr/textColorPrimary" />
            </androidx.appcompat.widget.Toolbar>
    </io.stanwood.framework.ui.widget.ParallaxToolbarLayout>
 </#if>
 <#if toolbarType=='appbar'>
    <androidx.appcompat.widget.Toolbar
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"/>
</#if>                
</com.google.android.material.appbar.AppBarLayout>
</#if>