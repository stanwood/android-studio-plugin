package ${kotlinEscapedPackageName}.ui

import android.content.Context
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentStatePagerAdapter

//TODO: Implement pager fragments
class ${adapterName}(fm: FragmentManager, val context: Context) : FragmentStatePagerAdapter(fm) {
    override fun getItem(position: Int) = Fragment()

    override fun getCount() = 3

    override fun getPageTitle(position: Int): CharSequence? = position.toString()
}