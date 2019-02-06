<?xml version="1.0" encoding="utf-8"?>
<layout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools">
<#if createItemViewModel>
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
        android:paddingBottom="@dimen/list_item_padding"
<#if itemSelectorType == 'default'>        
        android:background="?android:selectableItemBackground"
</#if>        
        android:padding="@dimen/list_item_padding"
<#if isDisableable>
        app:enabled="@{vm.enabled}"
</#if>
<#if isSelectable>
        app:selected="@{vm.selected}"
</#if>>

        <ImageView
            android:id="@+id/image"
            android:layout_width="0dp"
            android:layout_height="0dp"
            android:layout_marginEnd="@dimen/list_item_padding"
<#if createItemViewModel>
            android:src="@{imageUrl}"
</#if>
            app:layout_constraintBottom_toTopOf="@id/title"
            app:layout_constraintDimensionRatio="H,16:9"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent"
            tools:src="@mipmap/ic_launcher" />

        <TextView
            android:id="@+id/title"
            style="@style/SingleLineText"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_marginTop="@dimen/list_item_padding"
            android:paddingStart="@dimen/list_item_padding"
            android:paddingEnd="@dimen/list_item_padding"
<#if createItemViewModel>
            android:text="@{vm.title}"
</#if>
            android:textAppearance="@style/TextAppearance.App.Title"
            app:layout_constraintBottom_toTopOf="@id/subtitle"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@id/image"
            tools:text="Title" />

        <TextView
            android:id="@+id/subtitle"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:paddingStart="@dimen/list_item_padding"
            android:paddingEnd="@dimen/list_item_padding"
<#if createItemViewModel>
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