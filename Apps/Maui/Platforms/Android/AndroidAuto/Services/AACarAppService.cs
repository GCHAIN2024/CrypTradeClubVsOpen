using Android.App;
using AndroidX.Car.App;
using AndroidX.Car.App.Validation;
using Maui.Platforms.Android.AndroidAuto.Sessions;

namespace Maui.Platforms.Android.AndroidAuto.Services
{
    [Service(Exported = true)]
    [IntentFilter(new string[] { "androidx.car.app.CarAppService" }, Categories = new[] { "androidx.car.app.category.POI" })]
    public class AACarAppService : CarAppService
    {
        public override HostValidator CreateHostValidator()
        {
            System.Diagnostics.Debug.WriteLine("CreateHostValidator called.");
            return HostValidator.AllowAllHostsValidator;
        }

        public override Session OnCreateSession()
        {
            // 输出调试日志
            System.Diagnostics.Debug.WriteLine("OnCreateSession called.");
            return new AASession();
        }
    }
}
