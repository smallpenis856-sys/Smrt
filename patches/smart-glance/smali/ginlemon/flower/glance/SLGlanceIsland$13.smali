.class Lginlemon/flower/glance/SLGlanceIsland$13;
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


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;Landroid/app/Activity;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 355
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$13;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    iput-object p2, p0, Lginlemon/flower/glance/SLGlanceIsland$13;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .prologue
    .line 356
    :try_start_0
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$13;->val$a:Landroid/app/Activity;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_c} :catch_d

    .line 357
    :goto_c
    return-void

    .line 356
    :catch_d
    move-exception v0

    goto :goto_c
.end method
