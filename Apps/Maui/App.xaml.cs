
using static MauiLogics.Player;
using static MauiLogics.Types;
using static MauiLogics.Runtime;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Data;


namespace Maui
{
    public partial class App : Application
    {

       
        public App()
        {
            
            InitializeComponent();

            MainPage = new AppShell();
            //var playerLayout = (AbsoluteLayout)this.FindByName("playertem");
            //createUI(runtime.player.playList, runtime.player.playMode, playerLayout);
        }


    }
}
