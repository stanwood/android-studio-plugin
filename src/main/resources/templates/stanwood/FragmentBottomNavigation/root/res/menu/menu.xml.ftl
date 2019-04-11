<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto">
    <!-- TODO: Change ids and titles - make sure to use the same item IDs as the destination (not action!) IDs in the
    corresponding nav graphs! This will then sync the bottom bar status with the nav graph status.-->
    <item
        android:id="@+id/firstFragment"
        android:icon="@mipmap/ic_launcher"
        android:title="@string/${resourceName}_first_title"
        app:showAsAction="ifRoom" />
    <item
        android:id="@+id/secondFragment"
        android:icon="@mipmap/ic_launcher"
        android:title="@string/${resourceName}_second_title"
        app:showAsAction="ifRoom" />
    <item
        android:id="@+id/thirdFragment"
        android:icon="@mipmap/ic_launcher"
        android:title="@string/${resourceName}_third_title"
        app:showAsAction="ifRoom" />
</menu>