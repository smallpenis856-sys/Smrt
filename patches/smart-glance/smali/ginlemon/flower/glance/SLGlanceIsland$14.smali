.class Lginlemon/flower/glance/SLGlanceIsland$14;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lginlemon/flower/glance/SLGlanceIsland;->showSettings()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$keys:[Ljava/lang/String;

.field final synthetic val$values:[Z


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;[Ljava/lang/String;[ZLandroid/app/Activity;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 344
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$keys:[Ljava/lang/String;

    iput-object p3, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$values:[Z

    iput-object p4, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .prologue
    const/4 v0, 0x0

    .line 345
    iget-object v1, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    const-string v2, "music"

    invoke-static {v1, v2, v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1800(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;Z)Z

    move-result v1

    iget-object v2, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    const-string v3, "calendar"

    invoke-static {v2, v3, v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1800(Lginlemon/flower/glance/SLGlanceIsland;Ljava/lang/String;Z)Z

    move-result v2

    .line 346
    iget-object v3, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v3}, Lginlemon/flower/glance/SLGlanceIsland;->access$1900(Lginlemon/flower/glance/SLGlanceIsland;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    :goto_1b
    iget-object v4, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$keys:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_2e

    iget-object v4, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$keys:[Ljava/lang/String;

    aget-object v4, v4, v0

    iget-object v5, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$values:[Z

    aget-boolean v5, v5, v0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    :cond_2e
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 347
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$2000(Lginlemon/flower/glance/SLGlanceIsland;)V

    .line 348
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-eqz v0, :cond_48

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$2100(Lginlemon/flower/glance/SLGlanceIsland;)V

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$2200(Lginlemon/flower/glance/SLGlanceIsland;)V

    .line 349
    :cond_48
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$400(Lginlemon/flower/glance/SLGlanceIsland;)V

    .line 350
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$values:[Z

    const/4 v3, 0x2

    aget-boolean v0, v0, v3

    if-eqz v0, :cond_64

    if-nez v2, :cond_64

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$2300(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-nez v0, :cond_64

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$1600(Lginlemon/flower/glance/SLGlanceIsland;)V

    .line 354
    :cond_63
    :goto_63
    return-void

    .line 351
    :cond_64
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$values:[Z

    const/4 v2, 0x1

    aget-boolean v0, v0, v2

    if-eqz v0, :cond_63

    if-nez v1, :cond_63

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$2400(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-nez v0, :cond_63

    .line 352
    :try_start_75
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$14;->val$a:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_81
    .catch Ljava/lang/RuntimeException; {:try_start_75 .. :try_end_81} :catch_82

    goto :goto_63

    :catch_82
    move-exception v0

    goto :goto_63
.end method
