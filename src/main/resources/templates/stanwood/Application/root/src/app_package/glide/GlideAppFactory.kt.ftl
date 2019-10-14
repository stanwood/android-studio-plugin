package ${kotlinEscapedPackageName}.glide

import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment

interface GlideAppFactory {
    val glideRequests: GlideRequests
}

class GlideAppFragmentFactory(fragment: Fragment) : GlideAppFactory {
    override val glideRequests = GlideApp.with(fragment)
}

class GlideAppActivityFactory(activity: AppCompatActivity) : GlideAppFactory {
    override val glideRequests = GlideApp.with(activity)
}