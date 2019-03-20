package ${kotlinEscapedPackageName}.datasource.net.${apiFolderName}

import android.content.SharedPreferences
import io.reactivex.Observable

class ${authManagerClassName} {
    
    private val loggedIn: BehaviorSubject<Auth> = BehaviorSubject.create()

    fun isLoggedIn(): Observable<Auth> = loggedIn

    var auth: Auth = UnAuth
        set(value) {
            field.reset(sharedPreferences)
            sharedPreferences.edit().putInt(TYPE_KEY, value.type.id).apply()
            value.save(sharedPreferences)
            field = value

            loggedIn.onNext(Resource.Success(value))
        }

    fun reset() {
        auth.reset(sharedPreferences)
        auth = UnAuth
    }

    fun restore() {
        val type = Type.values()
            .find { it.id == sharedPreferences.getInt(TYPE_KEY, Type.UNAUTH.id) }
        auth = Auth.restore(type ?: Type.UNAUTH, sharedPreferences)
    }

    companion object {
        private const val TYPE_KEY = "type"
    }
}

// TODO add other authentication method types to this enum
enum class Type(val id: Int) { UNAUTH(0), PERSONAL_ACCESS_TOKEN(1) }

sealed class Auth(var username: String? = null) {
    abstract val type: Type

    open fun save(sharedPreferences: SharedPreferences) {
        sharedPreferences.edit().putString(USERNAME_KEY, username).apply()
    }

    open fun restore(sharedPreferences: SharedPreferences) {
        username = sharedPreferences.getString(USERNAME_KEY, null)
    }

    open fun reset(sharedPreferences: SharedPreferences) {
        sharedPreferences.edit().remove(USERNAME_KEY).apply()
    }

    companion object {
        private const val USERNAME_KEY = "username"

        fun restore(type: Type, sharedPreferences: SharedPreferences): Auth {
            return when (type) {
                Type.UNAUTH -> UnAuth.apply { restore(sharedPreferences) }
                Type.PERSONAL_ACCESS_TOKEN -> PersonalAccessTokenAuth().apply { restore(sharedPreferences) }
            }
        }
    }
}

// TODO add other authentication methods as subclasses of Auth here
// We strongly suggest to add one class per authentication type, even if their signature looks the
// same (e.g. username & token or token only) so that you can
// easily distinguish between different types (e.g. FacebookTokenAuth, GoogleTokenAuth...) helping
// you when you need to get e.g. a fresh token later on.

class PersonalAccessTokenAuth(username: String? = null, var paToken: String? = null) : Auth(username) {

    override fun save(sharedPreferences: SharedPreferences) {
        super.save(sharedPreferences)
        sharedPreferences.edit().apply {
            putString(PAT_TOKEN_KEY, paToken)
        }.apply()
    }

    override fun restore(sharedPreferences: SharedPreferences) {
        super.restore(sharedPreferences)
        paToken = sharedPreferences.getString(PAT_TOKEN_KEY, null)
    }

    override fun reset(sharedPreferences: SharedPreferences) {
        super.reset(sharedPreferences)
        sharedPreferences.edit().remove(PAT_TOKEN_KEY).apply()
    }

    override val type: Type
        get() = Type.PERSONAL_ACCESS_TOKEN

    companion object {
        private const val PAT_TOKEN_KEY = "pat_token"
    }
}

object UnAuth : Auth() {
    override fun save(sharedPreferences: SharedPreferences) {
        // no-op
    }

    override fun restore(sharedPreferences: SharedPreferences) {
        // no-op
    }

    override fun reset(sharedPreferences: SharedPreferences) {
        // no-op
    }

    override val type: Type
        get() = Type.UNAUTH
}