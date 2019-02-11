<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">
<#if createItemViewModel!false>
    <data>

        <variable
            name="vm"
            type="${packageName}<#if itemCreatePackage!false>.vm</#if>.${itemViewModelName}" />

        <variable
            name="imageUrl"
            type="java.lang.String"/>
    </data>
</#if>
    <androidx.constraintlayout.widget.ConstraintLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
<#if isClickableItem!false>
        android:background="?android:selectableItemBackground"
</#if>
        android:padding="@dimen/list_item_padding">

        <ImageView
            android:id="@+id/image"
            android:layout_width="48dp"
            android:layout_height="48dp"
            android:layout_marginEnd="@dimen/list_item_padding"
<#if createItemViewModel!false>
            android:src="@{imageUrl}"
</#if>
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toStartOf="@id/title"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent"
            tools:src="@mipmap/ic_launcher" />

        <TextView
            android:id="@+id/title"
            style="@style/SingleLineText"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
<#if createItemViewModel!false>
            android:text="@{vm.title}"
</#if>
            android:textAppearance="@style/TextAppearance.App.Title"
            app:layout_constraintBottom_toTopOf="@id/subtitle"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toEndOf="@id/image"
            app:layout_constraintTop_toTopOf="parent"
            tools:text="Title" />

        <TextView
            android:id="@+id/subtitle"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
<#if createItemViewModel!false>
            android:text="@{vm.subtitle}"
</#if>
            android:textAppearance="@style/TextAppearance.App.Subtitle"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="@id/title"
            app:layout_constraintTop_toBottomOf="@id/title"
            tools:text="Subtitle" />

    </androidx.constraintlayout.widget.ConstraintLayout>
</layout>