.class Lginlemon/flower/glance/SLGlanceIsland$4;
.super Ljava/lang/Object;
.source "SLGlanceIsland.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lginlemon/flower/glance/SLGlanceIsland;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lginlemon/flower/glance/SLGlanceIsland;


# direct methods
.method constructor <init>(Lginlemon/flower/glance/SLGlanceIsland;)V
    .registers 2

    .prologue
    .line 162
    iput-object p1, p0, Lginlemon/flower/glance/SLGlanceIsland$4;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 164
    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$4;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$200(Lginlemon/flower/glance/SLGlanceIsland;)Z

    move-result v0

    if-eqz v0, :cond_15

    const-string v0, "items_json"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object v0, p0, Lginlemon/flower/glance/SLGlanceIsland$4;->this$0:Lginlemon/flower/glance/SLGlanceIsland;

    invoke-static {v0}, Lginlemon/flower/glance/SLGlanceIsland;->access$600(Lginlemon/flower/glance/SLGlanceIsland;)V

    .line 165
    :cond_15
    return-void
.end method
